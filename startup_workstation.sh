#!/bin/sh
echo "<*****>STARTING UP WORKSTATION<*****>"
echo "<*****>https://www.tecmint.com/setup-a-developer-workstation-in-rhel-8/"
echo "<*****>Enabling Debug Repositories in RHEL 8"
# The Debug and source repositories contain useful information needed to debug various system components and measure their performance. Unfortunately, these repositories are not enabled by default on RHEL 8.
# To enable debug and source repositories in RHEL 8, use the following commands
subscription-manager repos --enable rhel-8-for-$(uname -i)-baseos-debug-rpms
subscription-manager repos --enable rhel-8-for-$(uname -i)-baseos-source-rpms
subscription-manager repos --enable rhel-8-for-$(uname -i)-appstream-debug-rpms
subscription-manager repos --enable rhel-8-for-$(uname -i)-appstream-source-rpms

echo "<*****>Installing Development Tools in RHEL 8"
# Next, we will install development tools and libraries, which will set up your system to develop or building applications using C, C++ and other common programming languages.
# The “Development Tools” package group provides the GNU Compiler Collection (GCC), GNU Debugger (GDB), and other related development tools.
dnf group install -y "Development Tools" 
# Also install the Clang and LLVM-based tool-chain which provides the LLVM compiler infrastructure framework, the Clang compiler for the C and C++ languages, the LLDB debugger, and related tools for code analysis.
dnf install -y llvm-toolset

echo "<*****>Installing Git in RHEL 8"
dnf install -y git
# For more information about Git, check out our article: How to Use Git Version Control System in Linux [Comprehensive Guide]

echo "<*****>Installing Debugging and Instrumentation Tools in RHEL 8"
# Debugging and instrumentation tools are used to track down and fix programming errors in an application under development. They help you monitor and measure performance, detect errors, and get trace information that represents the application’s state.
dnf install -y gdb valgrind systemtap ltrace strace
# To use the debuginfo-install tool, you should install the yum-utils package as shown.
dnf install -y yum-utils
# Then run a SystemTap helper script for setting up the environment: install kernel debuginfo packages. Note that the size of these packages exceeds 2 GiB.
stap-prep

echo "<*****>Installing Tools to Measure Application Performance in RHEL 8"
dnf install -y perf papi pcp-zeroconf valgrind strace sysstat systemtap
# Next, run a SystemTap helper script for setting up the required environment. As stated before, invoking this script installs kernel debuginfo packages whose size exceeds 2 GiB.
stap-prep
# Then start the Performance Co-Pilot (PCP) collector service for now and enable it to auto-start at system boot.
systemctl start pmcd
systemctl enable pmcd

echo "<*****>Installing Container Tools in RHEL 8/docker"
echo "<*****>https://linuxconfig.org/how-to-install-docker-in-rhel-8"
dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
dnf repolist -v
dnf install -y docker-ce-3:18.09.1-3.el7
systemctl enable --now docker
echo "<*****>Is docker active?"
systemctl is-active docker
# dnf install https://download.docker.com/linux/centos/7/x86_64/stable/Packages/containerd.io-1.2.6-3.3.el7.x86_64.rpm
