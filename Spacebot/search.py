import os
import re, string
import numpy as np
import pandas as pd
from sklearn.feature_extraction.text import TfidfVectorizer
import math


def retrieve_docs():
    all_files = os.listdir("dataset//")  # imagine you're one directory above test dir
    #print(all_files)  # won't necessarily be sorted
    path = "dataset/"
    documents = []
    for file in all_files:
        f = open(path + file, 'r')
        final = f.read()
        documents.append(final)
    #print('===============================')
    return documents


def docs_clean(documents):
    documents_clean = []
    for d in documents:
        document_test = re.sub(r'[^\x00-\x7F]+', ' ', d)
        document_test = re.sub(r'@\w+', '', document_test)
        document_test = document_test.lower()
        document_test = re.sub(r'[%s]' % re.escape(string.punctuation), ' ', document_test)
        document_test = re.sub(r'[0-9]', '', document_test)
        document_test = re.sub(r'\s{2,}', ' ', document_test)
        documents_clean.append(document_test)
    #print(len(documents_clean))
    #print(documents_clean)
    return documents_clean


def get_similar_articles(q, df):
    #print("query:", q)
    #print("Article with the highest cosine similarity value: ")
    q = [q]
    q_vec = vectorizer.transform(q).toarray().reshape(df.shape[0], )
    #print(f'QVec shape is ({q_vec.shape})')
    sim = {}
    for i in range(len(docs)):
        sim[i] = np.dot(df.loc[:, i].values, q_vec) / np.linalg.norm(df.loc[:, i]) * np.linalg.norm(q_vec)

    #print(sim)
    sim_sorted = sorted(sim.items(), key=lambda x: x[1], reverse=True)
    sorted_keys = []
    for k, v in sim_sorted:
        if v != 0.0 and v != np.NaN:
            #print("Similarity Value:", v)
            #print(docs[k])
            sorted_keys.append(k)
            #print()
    return sorted_keys


def get_similar_articles2(q, df, doc):
    #print("query:", q)
    #print("Article with the highest cosine similarity value: ")
    q = [q]
    q_vec = vectorizer.transform(q).toarray().reshape(df.shape[0], )
    #print(f'QVec shape is ({q_vec.shape})')
    sim = {}
    for i in range(len(doc)):
        sim[i] = np.dot(df.loc[:, i].values, q_vec) / np.linalg.norm(df.loc[:, i]) * np.linalg.norm(q_vec)

    #print(sim)
    sim_sorted = sorted(sim.items(), key=lambda x: x[1], reverse=True)
    result_queries = []
    for k, v in sim_sorted:
        if v != 0.0 and math.isnan(v) != True:
            #print("Similarity Value:", v)
            #print(doc[k])
            result_queries.append(doc[k])
            #print()
    return result_queries


vectorizer = TfidfVectorizer()
documents = retrieve_docs()
docs = docs_clean(documents)


def search(q):
    query = q
    X = vectorizer.fit_transform(docs)
    X.shape
    df = pd.DataFrame(X.T.toarray(), index=vectorizer.get_feature_names())
    #print(df.shape)
    df.head(20)
    sorted_docs = get_similar_articles(q, df)
    d = documents[sorted_docs[0]]
    doc = re.sub(r'\n{2}', ' ', d)
    doc = doc.split('\n')
    X1 = vectorizer.fit_transform(doc)
    X1.shape
    df1 = pd.DataFrame(X1.T.toarray(), index=vectorizer.get_feature_names())
    #print(df1.shape)
    df1.head(20)
    res = get_similar_articles2(query, df1, doc)
    return res
