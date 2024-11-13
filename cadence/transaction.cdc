import SetAndSeries from 0x01

transaction {

    let adminCheck: &SetAndSeries.Admin

    prepare(acct: auth(Storage) &Account) {
        self.adminCheck = acct.borrow<&SetAndSeries.Admin>(from: SetAndSeries.AdminStoragePath)
            ?? panic("Could not borrow admin reference")
    }

    execute {
        self.adminCheck.addSeries(seriesId: 1, metadata: {"Series": "1"})
        log("Series added")
    }
}
