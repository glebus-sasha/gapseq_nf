#!/usr/bin/env nextflow

include { gapseqFind }               from './processes/gapseqFind.nf'
include { gapseqFindTransport }      from './processes/gapseqFindTransport.nf'
include { gapseqDraft }              from './processes/gapseqDraft.nf'
include { gapseqFill }              from './processes/gapseqFill.nf'



workflow  {    
    genome = Channel.fromPath(params.data)
    genome |
    gapseqFind & gapseqFindTransport
    gapseqDraft(genome, gapseqFindTransport.out, gapseqFind.out.pathways, gapseqFind.out.reactions)
    gapseqFill(gapseqDraft.out.draft_rds)

}