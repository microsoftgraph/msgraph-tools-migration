# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License.
[string] $ArtifactsLocation = (Join-Path $PSScriptRoot "..\")
nuget spec Microsoft.Graph.Migration.Tool
Move-Item "Microsoft.Graph.Migration.Tool.nuspec" -Destination $ArtifactsLocation -Force

