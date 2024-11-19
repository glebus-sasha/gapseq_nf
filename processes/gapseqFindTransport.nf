process gapseqFindTransport {
    conda "bioconda::gapseq"
    container "cdiener/gapseq:latest"
    tag "$genome"
    errorStrategy "ignore"
    publishDir "${params.outdir}/gapseqFindTransport"

    input:
    path genome

    output:
    path "${genome.baseName}-Transporter.tbl"

    script:
    """
    gapseq find-transport -b 100 $genome
    """

    stub:
    """
    touch ${genome.baseName}-Transporter.tbl
    """
}
