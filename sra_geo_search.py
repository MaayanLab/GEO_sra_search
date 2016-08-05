#!/usr/bin/python

from Bio import Entrez

import sys
reload(sys)  
sys.setdefaultencoding('UTF8')    # Chaging default encoding to UTF8


def search(query):
    Entrez.email = 'your_email@mail.com'
    handle = Entrez.esearch(db = 'gds', 
                            ETYP = 'gse',
                            suppFile = 'sra',
                            retmax = '10000',
                            retmode = 'xml',
                            sort = 'relevance',  
                            term = query)
    results = Entrez.read(handle)
    return results

def search_summary(id_list):
    ids = ','.join(id_list)
    Entrez.email = 'your_email@mail.com'
    handle = Entrez.esummary(db='gds',
                           retmode='xml',
                           id=ids)
    results = Entrez.read(handle)
    return results



query_list = [
    'Homo sapiens[ORGN]',
    'Mus musculus[ORGN]',
    'Rattus norvegicus[ORGN]'
    ]


with open ('sra_geo_sra_search.txt', 'w') as output:
    for query in query_list:
        if __name__ == '__main__':
            results = search(query)
            print (results)
            id_list = results['IdList']
            gses = search_summary(id_list)
            print(query)
            print(id_list)
            for row in gses:
                # print(row['Accession'])
                row[0]=row['Accession']
                row[1] = row['title']
                row[2] = row['GPL']
                row[3] = row['summary']
                row[4] = row['PDAT']
                row[5] = row['taxon']
                row[6] = row['subsetInfo']
                row[7] = row['valType']

                output.write(row[0]+ ', ' + row[1] + ', ' +'GPL'+row[2] + ', ' + row[4] 
                    + ', ' + row[5] + '\n')
 
