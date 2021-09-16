#!/usr/bin/env bash
spectool -g *spec
fedpkg --release f35 mockbuild --mock-config fedora-35-x86_64
