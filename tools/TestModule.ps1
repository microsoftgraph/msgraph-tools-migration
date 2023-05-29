# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
$ErrorActionPreference = 'Stop'

# Install Pester
if (!(Get-Module -Name Pester -ListAvailable)) {
    Install-Module -Name Pester -Force -SkipPublisherCheck
}

$LoadTestScript = Join-Path $PSScriptRoot '../test/Microsoft.Graph.Migration.Tool.Tests.ps1'

Import-Module -Name Pester
$ModuleTestsPath = Join-Path $PSScriptRoot '../test'
$PesterConfiguration = [PesterConfiguration]::Default
$PesterConfiguration.Run.Path =  $LoadTestScript
$PesterConfiguration.Run.PassThru =  $true
$PesterConfiguration.CodeCoverage.Enabled  =  $true
$PesterConfiguration.TestResult.Enabled = $true
$PesterConfiguration.TestResult.OutputPath = (Join-Path $ModuleTestsPath "MigrationTool-TestResults.xml")

$TestResults = Invoke-Pester -Configuration $PesterConfiguration
If ($TestResults.FailedCount -gt 0) { Write-Error "$($TestResults.FailedCount) tests failed." }
