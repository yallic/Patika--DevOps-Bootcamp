

### 2.Hafta 1.Odev
---

## Table of contents[![](./docs/img/pin.svg)](#table-of-contents)

1. [Description](#Description)
2. [Usage](#usage)

---

#### Description: (#Description)

This script with multiple functions that change branch, create a new branch, compress the artifact file and choose to debug mode aims to build a Maven project. If the script is started without any parameter, the script will run on default parameters. The Example output screen is below:  

![Alt text](./docs/img/script1.png)

Parameters and default values are as follows:

    -b : This parameter is used to change the current branch and it makes to build on the changed branch. 
    -n : This parameter creates new branch.
    -f : This parameter selects to compress format. Default is tar. This parameter can take "tar" and "zip" values.If an invalid parameter is set, the script will exit
    -p : This parameter is used to change of compressed file path. Default path is the current path. 
    -d : This parameter determines to debug mode. This parameter can take "enable" and "disable" values.

There is a screen shot below that includes all parameters: 

![Alt text](./docs/img/script2.png)


#### Example Usage: [![](./docs/img/pin.svg)](#usage)

```shell

$ build.sh --help

Usage:
    -b  <branch_name>     Branch name
    -n  <new_branch>      Create new branch
    -f  <zip|tar>         Compress format
    -p  <artifact_path>   Copy artifact to spesific path
    -d  <debug_mode>      Enable debug mode



```


