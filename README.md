[![Build Status](https://travis-ci.com/cu-ecen-5013/autoconf-automake-example.svg?branch=master)](https://travis-ci.com/cu-ecen-5013/autoconf-automake-example)

# autoconf-automake-example
A project which demonstrates how to use [autoconf](https://www.gnu.org/savannah-checkouts/gnu/autoconf/) and [automake](https://www.gnu.org/software/automake/) to automatically generate a makefile with dependency support

This project is a part of a multi-part series of projects which show you the basics of automatic dependency generation for C projects.  See  also:
 * GNU Make automatic dependency generation: https://github.com/cu-ecen-5013/auto-dependency-generation-example

## Setting Up Automake
The steps used to generate automake are automated and annotated in [do-autoconf-automake-setup.sh](do-autoconf-automake-setup.sh).  These instructions are based on an example implementation from http://www.idryman.org/blog/2016/03/14/autoconf-tutorial-2/.  Run with no arguments to generate your `configure` script.

## Building and Installing
After setting up the configure script using `do-autoconf-automake-setup.sh` you can run the normal automake commands
```
./configure
make
sudo make install
```
`configure` will generate your Makefile for you.

## Testing
Run
```
make test
```
To run a test script which verifies automatic dependency functionality is working as expected.
