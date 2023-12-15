$taskname = "Start as system WipeDevice"
$taskdescription = "Start as system WipeDevice on registration"
$action = New-ScheduledTaskAction -Execute 'Powershell.exe -executionpolicy bypass -command echo ciao'
$trigger =  Get-CimClass "MSFT_TaskRegistrationTrigger" -Namespace "Root/Microsoft/Windows/TaskScheduler"
$settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit (New-TimeSpan -Minutes 5)
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskname -Description $taskdescription -Settings $settings -User "System"
