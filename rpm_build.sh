#!/usr/bin/env bash
spectool -g *spec
fedpkg --release f33 mockbuild --mock-config fedora-33-x86_64
