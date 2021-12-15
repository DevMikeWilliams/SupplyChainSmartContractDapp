var SupplyChain = artifacts.require("SupplyChain");

_contracts_migration("SupplyChain", function(_accounts) {
    if ("should assert true", function(done) {
        SupplyChain.deployed();
        Assert.isTrue(true);
        done();
    });
});