const cds = require("@sap/cds");

class CatalogService extends cds.ApplicationService {
  async init() {
    console.log("Service Init");
    const northwind = await cds.connect.to("Northwind");

    this.on("READ", ["Products"], (req) => {
      return northwind.run(req.query);
    });

    return super.init();
  }
}

module.exports = CatalogService;
