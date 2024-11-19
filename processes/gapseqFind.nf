process gapseqFind {
    conda "bioconda::gapseq"
    container "cdiener/gapseq:latest"
    tag "$genome"
    errorStrategy "ignore"
    publishDir "${params.outdir}/gapseqFind"

    input:
    path genome

    output:
    path "*-Pathways.tbl", emit: pathways
    path "*-Reactions.tbl", emit: reactions

    script:
    """
    gapseq find  -p all -b 100 -m Bacteria $genome
    """

    stub:
    """
    touch ${genome.baseName}-Pathways.tbl
    touch ${genome.baseName}-Reactions.tbl
    """
}