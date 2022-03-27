
elegytxd = engineLoadTXD("models/elegy.txd")
engineImportTXD(elegytxd,562)
elegydff= engineLoadDFF("models/elegy.dff")
engineReplaceModel(elegydff,562,true)

infernustxd = engineLoadTXD("models/infernus.txd")
engineImportTXD(infernustxd,411)
infernusdff= engineLoadDFF("models/infernus.dff")
engineReplaceModel(infernusdff,411,true)
