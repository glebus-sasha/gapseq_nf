process gapseqFill {
    conda "bioconda::gapseq"
    container "cdiener/gapseq:latest"
    tag "$genome"
    errorStrategy "ignore"
    publishDir "${params.outdir}/gapseqFill"

    input:
    path genome
    path draft_model

    output:
    path "*"

    script:
    """
    gapseq fill \
    -m $draft_model \
    -n /opt/gapseq/dat/media/meerwasser.csv \
    -c ${genome.baseName}-rxnWeights.RDS \
    -b 100 \
    -g ${genome.baseName}-rxnXgenes.RDS
    """

    stub:
    """
    touch ${genome.baseName}-Pathways.tbl
    touch ${genome.baseName}-Reactions.tbl
    """
}