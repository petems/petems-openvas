# openvas Puppet Module
[![Build Status](https://secure.travis-ci.org/petems/petems-openvas.svg)](https://travis-ci.org/petems/petems-openvas)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with openvas](#setup)
    * [What openvas affects](#what-openvas-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with openvas](#beginning-with-openvas)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Puppet module for installing, configuring, and managing [OpenVas](http://www.openvas.org/), "a framework of several services and tools offering a comprehensive and powerful vulnerability scanning and vulnerability management solution."

## Module Description

This module manages the installation of OpenVas.

## Setup

### What openvas affects

By default, this module will:
* Set up the package repository
* Install the openvas package
* Configure the /etc/sysconfig/openvas-* files
* Set up and enable the openvas services.

### Beginning with openvas

Most of Openvas's setup is handled by the package itself.

Full docs are avaliable here: http://www.openvas.org/

## Usage

This module includes a single class:
```puppet
include '::openvas'
```

You'll more than likely want to provide the appropriate values for your setup.

However, the service won't start until a number of preperation steps have been done. These are covered by the `openvas-setup` script. However, this can take a long time depending on your network speeds, so I've left it out of the module for now.

If you want to do that, something like this is what you need:

```puppet
class { '::openvas':
  initial_setup  => false,
  manage_service => false,
}
```

This will not manage the service inside of Puppet, as it will fail to start until the preperation steps have been completed. After you've got OpenVas working, you can manage the service with Puppet easily.

To opt out of repo management altogether, you'd specify it like so:
```puppet
class { '::openvas':
  manage_repo => false,
}
```

## Limitations

* Configuration is fairly surface level now
* Ubuntu, Debian, Fedora and others aren't supported yet

## Development

If you'd like to other features or anything else, check out the contributing guidelines in CONTRIBUTING.md.
