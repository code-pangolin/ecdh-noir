use crate::signature::Signature;
use crate::hash::iterhash;

struct PublicKey {
    payload: [[u8;32];32]
}

impl PublicKey {
    fn from_slice(slice: [u8]) -> Self {
        assert(slice.len() == 1024);

    let mut payload:[[u8;32];32] = [[0;32];32];

        for i in 0..32 {
            let mut chunk = [0;32];
            for j in 0..32 {
                chunk[j] =  slice[(i*32)+j];
            }
            payload[i] = chunk;
        }
        Self{
            payload:payload
        }
    }

    fn to_slice(self) -> [u8] {
        let mut res = [];

        for i in 0..31 {
            for j in 0..31 {
                res = res.push_back(self.payload[i][j]);
            }
        }

        res
    }

    fn verify(self,message:[u8],signature:Signature) -> bool {
        let msg = dep::std::hash::sha256(message);
        // verify signature
        for i in 0..32{
            let n = msg[i];
            if iterhash(signature.payload[i], 256 - (n as u64)) != self.payload[i] {
                false
            }
        }
        false
    }
}