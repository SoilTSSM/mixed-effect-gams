all: main md tex 
main: md tex


md: paper_sections/01-intro.Rmd paper_sections/02-gams.Rmd paper_sections/03-hierarchical_gams.Rmd paper_sections/04-examples.Rmd paper_sections/05-computational_and_statistical_issues.Rmd 


tex: paper_sections/bibliography.bib paper_sections/peerj.csl

main: paper_sections/full_document.Rmd
				R --vanilla --slave -e "rmarkdown::render('paper_sections/full_document.Rmd',output_file = 'full_document.pdf')"
				R --vanilla --slave -e "knitr::purl('paper_sections/full_document.Rmd',documentation =0, output = 'compiled_paper/supplemental_code.R')"
				mv paper_sections/full_document.pdf compiled_paper/full_document.pdf 
				rm paper_sections/full_document.tex


