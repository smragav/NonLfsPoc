function GetLatestNugetVersion{
    try{
        Write-Host "Checking for Nuget Package ${script:folderName}.nupkg"
        
        #$cmdOutput = jfrog rt s "${ARTIFACTORY_YS_LARGE_BINARY_PACKAGES}/**/replay-s385*" --sort-by name --sort-order desc --limit 1

        $output = jfrog rt s ys-large-files/replay-s385/*.zip
        #$json = Get-Content $output | Out-String | ConvertFrom-Json
        $converted = $output | ConvertFrom-Json 
        #Iterating the PS Object to get key Pair Values
        #$converted.props.psobject.properties | foreach-object { "$($_.name) : $($_.value)"}



        foreach ($data in $converted) {
            if ( $data.md5 -match "e0952bb1c626747634ceb1242a0d663a" ) {    
            write-host "$($data.path)"               
            }   
        }



        #Get key specific value from PSobject with key_name
        #$converted.props.psobject.properties["nuget.version"].Value.split(".")[0]
        
    }
    catch{
        $ErrorMessage = $_.Exception.Message
        Write-Host "$ErrorMessage"
    }
}
GetLatestNugetVersion