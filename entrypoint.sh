#!/bin/sh -l

dotnet build
dotnet dotcover test --dcReportType=HTML

extract_coverage.sh '<Root.*CoveragePercent="([0-9]*)"' 'dotCover.Output.html'
