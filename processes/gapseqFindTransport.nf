process gapseqFindTransport {
    conda "bioconda::gapseq"
    container "cdiener/gapseq:latest"
    tag "$genome"
    errorStrategy "ignore"
    publishDir "${params.outdir}/gapseqFindTransport"

    input:
    path genome

    output:
    path "*"

    script:
    """
    gapseq find-transport -b 100 $genome
    """

    stub:
    """
    touch 123.txt
    """
}