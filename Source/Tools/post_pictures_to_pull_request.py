import requests
import json
import base64
import os
import datetime
import logging

# Taken from https://github.com/LabVIEW-DCAF/buildsystem/blob/master/steps/post_pics_to_pr.py

_moduleLogger = logging.getLogger(__name__)


def _create_header(token):
    return {"Authorization": "token %s" % token.strip()}


def _read_picture(file_name):
    with open(file_name, "rb") as text:
        return base64.b64encode(text.read()).decode()


def _post_file(file_data, folder, file_name, header, picRepo):
    # put encoded data into json request
    new_file_data = json.dumps({"message": "commit message", "content": file_data})

    # post a picture to a repo
    url = "https://api.github.com/repos/%s/contents/%s/%s" % (picRepo, folder, file_name)

    r = requests.put(url, data=new_file_data, headers=header)
    if r.ok:
        _moduleLogger.info("Response code: %s", r.status_code)
    else:
        _moduleLogger.error("Bad response url: %s", url)
        _moduleLogger.error("Bad response code: %s", r.status_code)
        _moduleLogger.error("Bad response text: %s", r.text)
    return r.json()["content"]["download_url"]


def _post_comment_to_pr(urlPicPairs, diffFailures, pullRequestInfo, prNumber, header):
    formatString = "<details><summary><b>%s</b></summary>\n\n![capture](%s)</details>\n\n"
    body = """Bleep bloop!

LabVIEW Diff Robot here with some diffs served up hot for your pull request.

Notice something funny? Help fix me on [my GitHub repo.](https://github.com/ni/niveristand-custom-device-build-tools)


"""
    for pair in urlPicPairs:
        body += formatString % pair

    if diffFailures:
        body += "The following VIs could not be diffed: \n\n"
        for failure in diffFailures:
            body += "- " + failure + "\n"

    # pullRequestInfo contains data in the format "Jenkins/Folder/Path/org/reponame/PR-1",
    # where there is an arbitrary list of folders prior to the repository name. We assume the one
    # immediately preceding the repository name is the organization or username. Since there
    # can be an arbitrary number of slashes before the information we care about, we index from
    # the end of the list.
    org, repo, _ = pullRequestInfo.split("/")[-3:]
    url = "https://api.github.com/repos/%s/%s/issues/%s/comments" % (org, repo, prNumber)
    data = json.dumps({"body": body})
    r = requests.post(url, data=data, headers=header)
    if r.ok:
        _moduleLogger.info("Response code: %s", r.status_code)
    else:
        _moduleLogger.error("Bad response url: %s", url)
        _moduleLogger.error("Bad response code: %s", r.status_code)
        _moduleLogger.error("Bad response text: %s", r.text)


def post_pictures_to_pull_request(token, localPicfileDirectory, pullRequestInfo, prNumber, picRepo):
    print(
        "post_pictures_to_pull_request: ###, {0}, {1}, {2}, {3}".format(
            localPicfileDirectory, pullRequestInfo, prNumber, picRepo
        )
    )
    header = _create_header(token)
    pics = [f for f in os.listdir(localPicfileDirectory) if f.endswith(".png")]
    folder = pullRequestInfo + "/" + datetime.datetime.now().strftime("%Y-%m-%d/%H:%M:%S")
    picUrls = []
    for pic in pics:
        picData = _read_picture(os.path.join(localPicfileDirectory, pic))
        picUrl = _post_file(picData, folder, os.path.split(pic)[1], header, picRepo)
        picUrls.append((pic, picUrl))

    try:
        with open(localPicfileDirectory + "\\diff_failures.txt") as file:
            diffFailures = file.read().splitlines()
    except IOError:
        diffFailures = []

    if picUrls or diffFailures:
        _post_comment_to_pr(picUrls, diffFailures, pullRequestInfo, prNumber, header)
