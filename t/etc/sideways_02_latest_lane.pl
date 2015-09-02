{
  schema_class => 'Bio::Track::Schema',
  resultsets => [ qw(
    Assembly
    LatestLane
    LatestLibrary
    LatestMapstat
    LatestSample
    Lane
    Library
    LibraryType
    Mapstat
    Sample
    SeqCentre
    SeqTech
    Species
  ) ],
  fixture_sets => {
    main => [
      Assembly => [
        [ qw( assembly_id name reference_size taxon_id translation_table ) ],
        ['7','Plasmodium_falciparum_3D7_01Oct2010','23304547','36329','1'],
      ],
      Lane => [
        [ qw( row_id lane_id library_id seq_request_id name hierarchy_name acc readlen paired raw_reads raw_bases npg_qc_status processed auto_qc_status qc_status gt_status submission_id withdrawn note_id changed run_date storage_path latest manually_withdrawn ) ],
        [ '11411','11409','1','4','4347_1','4347_1',undef,undef,undef,undef,undef,undef,'0',undef,undef,'unchecked',undef,undef,undef,'2012-02-08 16:25:29',undef,undef,'0',undef],
        [ '11412','11409','1','4','4347_1','4347_1',undef,'54','1','0','0','pass','0',undef,undef,'unchecked',undef,undef,undef,'2012-02-08 16:25:29','2010-02-15 02:35:36',undef,'0',undef],
        [ '11445','11409','1','4','4347_1','4347_1',undef,'54','1','71138548','3841481592','pass','1',undef,undef,'unchecked',undef,undef,undef,'2012-02-08 17:08:36','2010-02-15 02:35:36',undef,'0',undef],
        [ '11469','11409','1','4','4347_1','4347_1',undef,'54','1','71138548','3841481592','pass','1','failed',undef,'unchecked',undef,undef,undef,'2012-02-08 18:47:48','2010-02-15 02:35:36',undef,'0',undef],
        [ '11470','11409','1','4','4347_1','4347_1',undef,'54','1','71138548','3841481592','pass','3','failed','pending','unchecked',undef,undef,undef,'2012-02-08 18:47:49','2010-02-15 02:35:36',undef,'0',undef],
        [ '39657','11409','1','4','4347_1','4347_1',undef,'54','1','71138548','3841481592','pass','11','failed','pending','unchecked',undef,undef,undef,'2013-07-09 14:39:08','2010-02-15 02:35:36','/nfs/pathnfs05/hashed_lanes/pathogen_euk_track/a/8/9/d/4347_1','0',undef],
        [ '43987','11409','1','4','4347_1','4347_1',undef,'54','1','71138548','3841481592','pass','11','failed','pending','unchecked','128',undef,undef,'2013-09-05 21:00:42','2010-02-15 02:35:36','/nfs/pathnfs05/hashed_lanes/pathogen_euk_track/a/8/9/d/4347_1','0',undef],
        [ '43988','11409','1','4','4347_1','4347_1','ERR333727','54','1','71138548','3841481592','pass','11','failed','pending','unchecked','128',undef,undef,'2013-09-05 21:00:42','2010-02-15 02:35:36','/nfs/pathnfs05/hashed_lanes/pathogen_euk_track/a/8/9/d/4347_1','1',undef],
      ],
      Library => [
        [ qw(
          row_id
          library_id
          library_request_id
          sample_id
          ssid
          name
          hierarchy_name
          prep_status
          auto_qc_status
          qc_status
          fragment_size_from
          fragment_size_to
          library_type_id
          library_tag
          library_tag_group
          library_tag_sequence
          seq_centre_id
          seq_tech_id
          open
          note_id
          changed
          latest
        ) ],
        [ 3,1,1,1,undef,'3C_HindIII 89182','3C_HindIII_89182','unknown',undef,'no_qc',undef,undef,undef,undef,undef,undef,undef,undef,1,undef,'2010-11-17 21:12:14',0],
        [ 4,1,1,1,89182,'3C_HindIII 89182','3C_HindIII_89182','passed',undef,'no_qc',250,300,1,undef,undef,undef,1,1,1,undef,'2010-11-17 21:12:14',0],
        [ 1482,1,1,1,'89182','3C_HindIII 89182','3C_HindIII_89182','passed','failed','no_qc',250,300,1,undef,undef,undef,1,1,1,undef,'2011-02-12 16:26:20',0],
        [ 1483,1,1,1,'89182','3C_HindIII 89182','3C_HindIII_89182','passed','failed','pending',250,300,1,undef,undef,undef,1,1,1,undef,'2011-02-12 16:26:21',0],
        [ 2384,1,1,1,'89182','3C_HindIII 89182','3C_HindIII_89182','pending','failed','pending',250,300,1,undef,undef,undef,1,1,1,undef,'2011-05-20 03:58:19',1],
      ],
      LibraryType => [
        [ qw( library_type_id name ) ],
        [1,'Standard'],
        [2,'NlaIII gene expression'],
        [3,'Custom'],
        [4,'Small RNA'],
        [5,'Illumina cDNA protocol'],
        [6,'Double size selected'],
        [7,'No PCR'],
        [8,'Long range'],
        [9,'ChiP-seq'],
        [10,'qPCR only'],
      ],
      Mapstat => [
        [ qw( row_id mapstats_id lane_id mapper_id assembly_id raw_reads raw_bases clip_bases reads_mapped reads_paired bases_mapped rmdup_reads_mapped rmdup_bases_mapped adapter_reads error_rate mean_insert sd_insert gt_expected gt_found gt_ratio note_id changed latest bait_near_bases_mapped target_near_bases_mapped bait_bases_mapped mean_bait_coverage bait_coverage_sd off_bait_bases reads_on_bait reads_on_bait_near reads_on_target reads_on_target_near target_bases_mapped mean_target_coverage target_coverage_sd target_bases_1x target_bases_2x target_bases_5x target_bases_10x target_bases_20x target_bases_50x target_bases_100x exome_design_id percentage_reads_with_transposon is_qc prefix ) ],
        ['3555','3554','11409',undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,'2012-02-08 18:47:49','0',undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,'0','_'],
        ['3556','3554','11409','7','7','1872066','101091564','100720192','1404918','834837','75115658','1388506','74274658','27','0.0173201','697.3','1547.2',undef,undef,undef,undef,'2012-02-08 18:47:49','1',undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,'7787762',undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,undef,'1','_'],
      ],
      Sample => [
        [ qw( row_id sample_id project_id ssid name hierarchy_name individual_id note_id changed latest ) ],
        [ 1,1,0,undef,'3C_HindIII','3C_HindIII',undef,undef,'2010-11-17 21:12:10',0 ],
      ],
      SeqCentre => [
        [ qw( seq_centre_id name) ],
        [ 1, 'SC' ],
      ],
      SeqTech => [
        [ qw( seq_tech_id name) ],
        [ 1, 'SLX' ],
      ],
      Species => [
        [ qw( species_id name taxon_id ) ],
        ['21','Plasmodium falciparum 3D7','36329'],
      ],
    ],
  },
};
