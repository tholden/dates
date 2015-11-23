OCTAVE=octave-cli
MATLAB=`which matlab`

all: check-octave check-matlab

check-octave:
	@cd tests ;\
	$(OCTAVE) --no-init-file --silent --no-history runalltests.m

check-matlab:
	@$(MATLAB)  -nosplash -nodisplay -r "cd tests; runalltests; quit"
