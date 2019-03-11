SHELL=/bin/bash
filename=main
out=astro2020

tardir=tarball
figdir=./figures
figures=$(figdir)/{dwarf_observability_barplot_*.pdf,StrongMicrolensing.png,bsdm_limits.pdf,annih_limits.pdf,nevents_vs_t.pdf,interactions.pdf,sigmav.pdf,dmbaryon_pk2.png,macho_limits.pdf,halo_mass_redshift_log.png,halo_mass_lensing_sn.pdf,axions.png,alps.jpg,massivestar.png,DMDE-anisotropy.png,LSST_Mmin.pdf,streamgap_constraints_3.png,2045_vla_dec96_x.png,Clone_labeled.png,wdm_constraints_yh.png,Fisher_space_Pk_SIDM_rev.pdf,microlensing_cartoon.png,SIDM_WDM_fig*.pdf,WDM_SIDM_discovery_test.pdf}
source=$(filename).tex $(filename).bbl $(filename).bib affiliations.tex endorsers.tex institutionAliases.tex macros.sty aas_macros.sty JHEP.bst yahapj.bst

main:
	#latexmk -g -f -pdf -interaction=nonstopmode main
	latexmk -g -pdf $(filename)
	cp $(filename).pdf $(out).pdf

tarball: #main
	rm -f $(out).tar.gz
	mkdir -p $(tardir) $(tardir)/$(figdir)
	cp $(figures) $(tardir)/$(figdir)
	cp -r $(source) $(tardir)
	cp $(filename).pdf $(tardir)
	cd $(tardir) && tar -czf ../$(out).tar.gz . && cd ..
	rm -rf $(tardir)


clean:
	rm -f *.blg *.fdb_latexmk *.fls main.log main.bbl  mainNotes.bib *.aux
