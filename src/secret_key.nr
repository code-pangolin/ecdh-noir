use crate::signature::Signature;
use crate::public_key::PublicKey;
use crate::hash::iterhash;

struct SecretKey {
    payload: [[u8;32];32]
}

impl SecretKey {
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

        for i in 0..32 {
            for j in 0..32 {
                res = res.push_back(self.payload[i][j]);
            }
        }

        res
    }

    fn sign_message(self,message:[u8]) -> Signature {

        let msg = dep::std::hash::sha256(message);

        dep::std::println(msg);

        let mut sig:[[u8;32];32] = [[0;32];32];

        // generate signature
        for i in 0..32{
            let n = msg[i];
            sig[i] = iterhash(self.payload[i],n as u64);
        }

        Signature{
            payload:sig
        }
    }

    fn public_key(self) -> PublicKey{
        let mut pk:[[u8;32];32] = [[0;32];32];

        for i in 0..32{
            pk[i] = iterhash(self.payload[i],256);
        }

        PublicKey{
            payload:pk
        }
    }

    fn verify(self,message:[u8],signature:Signature) -> bool {
        let pk = self.public_key();
        pk.verify(message,signature)
    }

}

#[test]
fn test_sign_verify(){
    let message = "hello world";
    let mut sk = [[0;32];32];

    for i in 0..32{
        for j in 0..32{
             sk[i][j] = 255-j;
        }
    }

    let sk = SecretKey{
        payload: sk
    };

    let sig = sk.sign_message(array_to_slice(message.as_bytes()));

    assert(sk.verify(array_to_slice(message.as_bytes()),sig));
}

fn array_to_slice<T,N>(input:[T;N]) -> [T] {
    let mut slice = [];
    for i in 0..N{
        slice = slice.push_back(input[i]);
    }
    slice
}