function Rename-PictureFiles {
    param (
        [string]$folderPath = Read-Host "please enter the folder name"
    )

    # Check if the folder exists
    if (-not (Test-Path -Path $folderPath -PathType Container)) {
        Write-Host "Directory '$folderPath' does not exist."
        return
    }

    # Get all files in the directory
    $files = Get-ChildItem -Path $folderPath

    # Initialize a counter for numbering
    $counter = 1

    # Rename each file
    foreach ($file in $files) {
        $newName = "Thailand$counter"
        $newPath = Join-Path -Path $folderPath -ChildPath $newName

        # Check if the new name already exists, if so, increment the counter
        while (Test-Path -Path $newPath -PathType Leaf) {
            $counter++
            $newName = "Thailand$counter"
            $newPath = Join-Path -Path $folderPath -ChildPath $newName
        }

        # Rename the file
        Rename-Item -Path $file.FullName -NewName $newName
        Write-Host "Renamed $($file.Name) to $newName"
        
        # Increment the counter for the next file
        $counter++
    }
}

# Usage: Rename-PictureFiles -folderPath "C:\Path\To\some name"
