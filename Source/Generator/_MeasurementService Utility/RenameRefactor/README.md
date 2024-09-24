This folder contains utility VIs in order to refactor calling code in projects due to renames of VIs, libraries, classes, etc. that were performed in another project. 
It has only been tested against refactor use cases as they become relevant, and it doesn't make any guarantees as a general purpose tool for all possible rename/refactoring use cases. 

As a starting point, look at either `Refactor Dependencies for Projects.vi` or `Refactor Dependencies for Project.vi`. The utilities currently support rename/refactor use cases for:
1. Renaming a VI or typedef.
1. Renaming a library. Refactor of dependencies to a file occur before refactors to dependencies of a library. If refactoring for a rename to a file within a renamed library at the same time, 
then the refactor information for the file should include the final name/path which incorporates the renamed library information.
1. Renaming a class. In this case, only the parent class relationship of existing classes is updated as necessary. Refactor information for classes should be specified as part of the library information.

Refactor information provided to the utilities is divided into individual file data (impacts one file) and library (impacts multiple files). In both case, developers should provide the old and new 
qualified name in memory along with the path on disk to the renamed file. Assuming the renames files are installed to `<vilib>`, then the paths specified should start with the pseudopath "\<vilib>:\\"

