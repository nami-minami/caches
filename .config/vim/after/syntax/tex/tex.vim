syn match texOnlyMath "[_^]" transparent contained contains=NONE  
"syn region texRefZone		matchgroup=texStatement start="\\bibitem{"		end="}\|%stopzone\>"	contains=@texRefGroup

