############################
#  Open a sound file in praat
#  and display the time-series signal
#  and the frequency spectrum.
############################

form ShowPraatSpect
	text wavFileLoc
endform

#A sound file is opened from the directory:
Read from file... 'wavFileLoc$'
sound_one$ = selected$ ("Sound")

start = Get start time
end   = Get end time

View & Edit