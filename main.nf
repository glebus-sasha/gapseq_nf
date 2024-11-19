#!/usr/bin/env nextflow

include { gapseqFind }               from './processes/gapseqFind.nf'
include { gapseqFindTransport }      from './processes/gapseqFindTransport.nf'


workflow  {    
    Channel.fromPath(params.data) |
    gapseqFind & gapseqFindTransport

}