process gapseqDraft {
    conda "bioconda::gapseq"
    container "cdiener/gapseq:latest"
    tag "$genome"
    errorStrategy "ignore"
    publishDir "${params.outdir}/gapseqDraft"


    input:
    path genome

    output:
    path "*"

    script:
    """
    gapseq draft -r $shname-all-Reactions.tbl -t $shname-Transporter.tbl -p $shname-all-Pathways.tbl -c $filename -u 100 -l 50
    """

    stub:
    """
    touch 123.txt
    """
}