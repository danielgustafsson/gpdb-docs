#
# Greenplum Documentation top level Makefile
#
# This builstep requires the dita-ot bin/ directory to be in PATH
#

OBJS=GPAdminGuide.pdf GPRefGuide.pdf WinClientTools.pdf \
	 gpdb-webhelp.pdf GPClientToolsUnix.pdf	GPUtilityGuide.pdf \
	 WinLoadTools.pdf

pdf: $(OBJS)

all: pdf

%.pdf: %.ditamap
	dita --input=$< --format=pdf --propertyfile=$(subst ditamap,ditaval,$<) --output=./ -l $<.pdf.log

clean:
	rm -rf $(OBJS) out.log
