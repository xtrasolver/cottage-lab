(kubectl -n longhorn-system get snapshots -o json | ConvertFrom-Json).items | ForEach-Object {
    $snapshotName = $_.Metadata.Name
    Write-Output "Deleting snapshot: $snapshotName"
    kubectl -n longhorn-system delete snapshot $snapshotName
}