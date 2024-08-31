# OpenDike

<p align="center">
  <img src="./assets/logo.png" alt="OpenDike" width="400">
</p>


## Abstract

This repository contains the instructions for install *OpenDike* and a guide of how to use it.

*OpenDike* is an open-source project to help students and professionals in different hidraulic problems calculating the resistance of a dike in abstract scenarios to pass an exam or in real projects where a failure in these calculations can destroy a little village under the dike.


## Options

### New Project

Create a new project using one of the five possible hypothesis and see the results.

### Open Project

The idea is to save the projects in an specific format, possible JSON to load them and remake the calculations so you can save the project or the results you did it before.

One idea should be:

```json
{
  "projectName": "Sample Project",
  "hypothesis": 1, //2, 3, 4, or 5
  "fields": {
    "field1": "value1",
    "field2": "value2"
    //....
  }
}
```

### Settings

Just stuff to change on the interface.
