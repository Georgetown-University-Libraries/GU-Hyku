// @ts-nocheck
const work_type = false;

const collection_bulkrax_id = false;

const header_map = {
  "abstract": {patterns: [/description\.abstract.*/], count: 0},
  "advisor": {patterns: [/contributor\.advisor.*/], count: 0},
  "alternative_title": {patterns: [/title\.alternative.*/], count: 0},
  "archivesspace_id": {patterns: [/archivesspace\.id.*/], count: 0},
  "bibliographic_citation": {patterns: [/identifier\.bibliographicCitation.*/, /identifier\.citation.*/], count: 0},
  "contributor": {patterns: [/contributor$/, /contributor\[.*\]/, /contributor\.(other|illustrator|editor).*/, /description\.sponsorship.*/], count: 0},
  "coverage": {patterns: [/coverage.*/], count: 0},
  "creator": {patterns: [/creator.*/, /contributor\.author.*/], count: 0},
  "date_available": {patterns: [/date\.available.*/], count: 0},
  "date_copyrighted": {patterns: [/date\.dateCopyrighted.*/], count: 0},
  "date_created": {patterns: [/date\.created.*/, /date$/, /date\[.*\]/], count: 0},
  "date_issued": {patterns: [/date\.issued.*/], count: 0},
  "description": {patterns: [/description$/, /description\[.*\]/, /description\.(alt|provenance|statementofresponsibility|uri|version).*/], count: 0},
  "doi": {patterns: [/identifier\.doi.*/], count: 0},
  "embargo_date": {patterns: [/embargo\.custom-date.*/], count: 0},
  "embargo_lift_date": {patterns: [/embargo\.lift-date.*/], count: 0},
  "embargo_terms": {patterns: [/embargo\.terms.*/], count: 0},
  "extent": {patterns: [/format\.extent.*/], count: 0},
  "format": {patterns: [/format$/, /format\[.*\]/, /format\.medium.*/], count: 0},
  "identifier": {patterns: [/identifier.*/], count: 0},
  "is_part_of_series": {patterns: [/relation\.(ispartofseries|isPartOfSeries).*/], count: 0},
  "issn": {patterns: [/identifier\.issn.*/], count: 0},
  "keyword": {patterns: [/subject$/, /subject\[.*\]/, /subject\.(classification|ddc|lcc|mesh|other).*/], count: 0},
  "language": {patterns: [/language.*/], count: 0},
  "orcid": {patterns: [/identifier\.orcid.*/], count: 0},
  "provenance": {patterns: [/^dc\.provenance.*/], count: 0},
  "publisher": {patterns: [/publisher.*/], count: 0},
  "relation": {patterns: [/relation$/, /relation\[.*\]/, /relation\.(haspart|hasversion|isbasedon|isPartOf|isFormatOf|isreferencedby|isreplacedby|isversionof|replaces|requires|uri).*/], count: 0},
  "resource_type": {patterns: [/type.*/], count: 0},
  "rights_notes": {patterns: [/rights.*/], count: 0},
  "source": {patterns: [/source.*/, /contributor\.repository.*/], count: 0},
  "subject": {patterns: [/subject\.lcsh.*/ ], count: 0},
  "table_of_contents": {patterns: [/description\.(tableofcontents|tableOfContents).*/], count: 0},
  "title": {patterns: [/title$/, /title\[.*\]/], count: 0},
}

const ignored_headers = [/date\.accessioned.*/, /rights\.license.*/, /rights\.uri.*/, /format\.mimetype.*/, /angelica\.id.*/, /angelica\.worknum.*/];

const language_map = {
  "English": [/^en.*/]
}

const handle_pattern = /\d{5}\/(\d{7}|\d{6})/

const handle_uri_pattern = /http[^\|\|]*handle[^\|\|]*\d{5}\/(\d{7}|\d{6})/g

function preImport() {
  var sheet = SpreadsheetApp.getActiveSpreadsheet().getSheets()[0];
  var metadata = transpose(sheet.getDataRange().getValues());
  replace_headers(metadata);
  create_additional_headers(sheet, metadata);
  remediate(metadata);
  create_remediated_sheet(metadata);
}

function create_remediated_sheet(metadata) {
  var spreadsheet = SpreadsheetApp.getActiveSpreadsheet();
  var remediated_sheet = spreadsheet.getSheetByName("remediated");
  if (remediated_sheet == null) {
    spreadsheet.insertSheet("remediated");
  }
  else {
    spreadsheet.deleteSheet(remediated_sheet);
    spreadsheet.insertSheet("remediated");
  }
  var remediated_sheet = spreadsheet.getSheetByName("remediated");
  for (var i = 0; i < metadata.length; i++) { 
    var column_length = metadata[i].length;
    for (var j = 0; j < column_length; j++) {
      remediated_sheet.getRange(j + 1, i + 1).setValue(metadata[i][j]);
    }
  }
}

function create_additional_headers(sheet, metadata) {
  var array = []
  array.length = sheet.getLastRow() - 1;
  metadata.splice(0, 0, ['bulkrax_id'].concat(array));
  metadata.splice(1, 0, ['handle'].concat(array));
  metadata.splice(2, 0, ['model'].concat(array));
  metadata.splice(3, 0, ['parents'].concat(array));
  metadata.splice(4, 0, ['file'].concat(array));
}

function replace_headers(metadata) {
  var properties = Object.keys(header_map);
  for (var column of metadata) {
    var header = column[0];
    if (header == "id" || header == "collection") {
      metadata.splice(metadata.indexOf(header), 1);
    }
    for (var property of properties) {
      var patterns = header_map[property].patterns;
      for (var pattern of patterns) {
        if (header.match(pattern) && !matches_ignored_headers(header)) {
          var count = header_map[property].count;
          if (count > 0) {
            column[0] = property + "_" + count; 
          }
          else {
            column[0] = property; 
          }
          header_map[property].count ++; 
        }
      }
    }
  }
  return metadata;
}

function remediate(metadata) {
  for (var column of metadata) {
    var header = column[0];
    if (header.match(/identifier/)) {
      for (var i = 1; i < column.length; i++) {
        var value = String(column[i]);
        if (value.match(handle_pattern)){
          var handle = value.match(handle_pattern)[0];
          value = value.replace(handle_uri_pattern, "");
          column[i] = value;
          metadata[1][i] = handle;
        }
      }
    }
    else if (header.match(/language/))  {
    }
    else if (header == "model")  {
      if (work_type) {
        for (var i = 1; i < column.length; i++) {
          column[i] = work_type;
        }
      }
    }
    else if (header == "parents")  {
      if (collection_bulkrax_id) {
        for (var i = 1; i < column.length; i++) {
          column[i] = collection_bulkrax_id;
        }
      }
    }
  }
}

function matches_ignored_headers(header) {
  for (pattern of ignored_headers) {
    if (header.match(pattern)) {
      return true; 
    }
  }
  return false; 
}

function transpose(a) {
    return Object.keys(a[0]).map(function(c) {
        return a.map(function(r) { return r[c]; });
    });
}