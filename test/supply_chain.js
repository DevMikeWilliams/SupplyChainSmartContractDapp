var SupplyChain = artifacts.require("SupplyChain");

var addressA = "0xb3832B4833607c7b47619F1289650Cc89e58238D";
var addressB = "0x4754Bc62D54C98138C806B877fcD7AeDae24cfbF";
var addressC = "0xd735FbE1f61c5d2c2f6C0494E500d0213B9A3404";

var MANUFACTURER = "Manufacturer";
var SUPPLIER = "Supplier";


contract("SupplyChain", async accounts => {
    it("should return Participant details", async () => {

        let instance = await SupplyChain.deployed();
        let participantId = await instance.addParticipant("A", "passA", addressA, MANUFACTURER);
        let participant = await instance.participants(0);
        assert.equal(participant[0], "A");
        assert.equal(participant[2], MANUFACTURER);

        participantId = await instance.addParticipant("B", "passB", addressB, SUPPLIER);
        participant = await instance.participants(1);
        assert.equal(participant[0], "B");
        assert.equal(participant[2], SUPPLIER);

        participantId = await instance.addParticipant("C", "passC", addressC, "Consumer");
        participant = await instance.participants(2);
        assert.equal(participant[0], "C");
        assert.equal(participant[2], "Consumer");
    });
});