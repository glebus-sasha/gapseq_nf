process gapseqDraft {
    conda "bioconda::gapseq"
    container "cdiener/gapseq:latest"
    tag "$genome"
    errorStrategy "ignore"
    publishDir "${params.outdir}/gapseqDraft"


    input:
    path genome
    path transporter
    path pathways
    path reactions

    output:
    path "${genome.baseName}-all-Pathways.tbl", emit: all_pathways
    path "*.-draft.RDS",                        emit: draft_rds

    script:
    """
    gapseq draft -r $reactions -t $pathways -p ${genome.baseName}-all-Pathways.tbl -c $genome -u 100 -l 50
    """

    stub:
    """
    touch 123.txt
    """
}