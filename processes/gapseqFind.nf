process gapseqFind {
    conda "bioconda::gapseq"
    container "cdiener/gapseq:latest"
    tag "$genome"
    errorStrategy "ignore"
    publishDir "${params.outdir}/gapseqFind"

    input:
    path genome

    output:
    path "*"

    script:
    """
    gapseq find -p all -b 100 -m Bacteria $genome
    """

    stub:
    """
    touch 123.txt
    """
}