
ballas2TXD = engineLoadTXD("model/ballas2.txd")
engineImportTXD(ballas2TXD,103)
ballas2DFF= engineLoadDFF("model/ballas2.dff")
engineReplaceModel(ballas2DFF,103,true)

maleTXD = engineLoadTXD("model/MALE.txd")
engineImportTXD(maleTXD,1)
maleDFF= engineLoadDFF("model/MALE.dff")
engineReplaceModel(maleDFF,1,true)

