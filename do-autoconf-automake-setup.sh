#!/bin/sh
# Sets up an autoconf/automake project
# See example setup idea at http://www.idryman.org/blog/2016/03/14/autoconf-tutorial-2/

# TODO: Configure the section below for your application
appname="automaketest"
version="1.0"
sources="main.c file1.c file2.c"
# --- End of configuration section
cat << EOF > configure.ac
# See https://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/autoconf.html#Initializing-configure
AC_INIT([${appname}],[${version}])
# See https://www.gnu.org/software/automake/manual/html_node/Public-Macros.html
# and see https://www.gnu.org/software/automake/manual/html_node/List-of-Automake-options.html#List-of-Automake-options for options
# -Wall and -Werror tells automake to use these compiler flags when building the makefile (see https://www.gnu.org/software/automake/manual/html_node/automake-Invocation.html#automake-Invocation).
# foreign says we aren't going to conform to gnu coding standard (with README, ChangeLog, AUTHORS and other required files in the home directory)
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
# Find a valid C compiler
AC_PROG_CC
# Tell automake to create the Makefile for us
# See https://www.gnu.org/software/automake/manual/html_node/Requirements.html
AC_CONFIG_FILES([Makefile])
# Tell autoconf to create the ./configure script
AC_OUTPUT
EOF
cat << EOF > Makefile.am
# A list of all programs generated with this project
# The bin_ prefix means the install of these programs will be to the bindir directory (typically /bin) when running the make install target
bin_PROGRAMS = ${appname}
# A list of source files to use when generating the makefile
${appname}_SOURCES = ${sources}
EOF
# See https://www.gnu.org/software/autoconf/manual/autoconf-2.68/html_node/autoreconf-Invocation.html
# Update configure scripts with verbose, install (add-missing) and force arguments to setup a configure
# script with latest content of configure.ac and Makefile.am created above
autoreconf -vif
