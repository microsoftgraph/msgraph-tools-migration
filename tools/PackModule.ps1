# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
Param(
    [string] $ModuleNuspec = (Join-Path $PSScriptRoot "..\Microsoft.Graph.Migration.Tool.nuspec"),
    [string] $ArtifactsLocation = (Join-Path $PSScriptRoot "..\artifacts")
)

if (-not (Test-Path $ModuleNuspec -PathType Leaf)) {
    Write-Error "Nuspec file not found: $ModuleNuspec."
}
Nuget pack $ModuleNuspec -OutputDirectory $ArtifactsLocation