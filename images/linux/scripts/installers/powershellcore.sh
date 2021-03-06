#!/bin/bash -e
################################################################################
##  File:  powershellcore.sh
##  Desc:  Installs powershellcore
################################################################################

# Source the helpers for use with the script
source $HELPER_SCRIPTS/os.sh

# Install Powershell
if isUbuntu20 ; then
    dotnet tool install --tool-path /opt/microsoft/powershell/7 powershell
    ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
fi

if isUbuntu16 || isUbuntu18 ; then
    apt-get install -y powershell
fi

# Run tests to determine that the software installed as expected
echo "Testing to make sure that script performed as expected, and basic scenarios work"
if ! command -v pwsh; then
    echo "pwsh was not installed"
    exit 1
fi
if ! pwsh -c 'Write-Host Hello world'; then
    echo "pwsh failed to run"
    exit 1
fi
