# Using the LabVIEW Diff Tool

## Intro

This folder contains a utility to allow the LabVIEW CLI to create a Diff between two VIs. In this repository, the utlility is used to take screenshots of all modified and all new VIs. Furthermore, these screenshots contain a description of the differences.

An example of the output of this VI would be the following image:

![ Diff in the DCAF Scan Engine module](https://raw.githubusercontent.com/DCAF-Builder/diff-pics/master/LabVIEW-DCAF/Scan-Engine-Module/PR-53/2018-07-12/10%3A27%3A41/Scan%20Engine%20editor%20node.lvclass--Generate%20Channels%20Dialog.vi.png)

## Using the CLI

This tool is packaged as an extension to the [LabVIEW CLI](http://www.ni.com/download/labview-command-line-interface-18.0/7545/en/). It should be called using the `-AdditionalOperationDirectory` argument and point it to the  `-OperationName` *DiffVI*

This command takes the following arguments:

1. `-NewVI` - Full path to the new version of the VI
2. `-OldVI` - Optional. Full path to the older version of the VI
3. `-OutputDir` - Path to the folder where the screenshot will be created

## Example Scripts

These tools can be called as part of a CI Workflow such as this Repository's. For an example on how to set up a script to take advantage of this, check out [labview_diff.py](https://github.com/ni/niveristand-custom-device-build-tools/blob/master/resources/labview_diff.py).

If you have created Pull Requests on GitHub and would like to create a post with the diff as part of your workflow, check out [github_commenter.py](https://github.com/ni/niveristand-custom-device-build-tools/blob/master/resources/github_commenter.py).
