# authentication

The world of warcraft clients using a custom version of [SRP6](http://srp.stanford.edu/whatisit.html) (Secure Remote Password protocol).
Based on the logic of SRP the server-side never requires a password in cleartext.
Neither on registration nor on authentication.
The server side requires only a 32 bytes large salt as well as the password verifier.

An example implementation for golang is available at [github](https://github.com/blizzlike-org/wowpasswd).

## compute the password verifier

OpenSSL bignum provides all the necessary tooling to compute all SRP related values.
the password verifier value is based upon a random 32 byte salt whch can be computed through `BN_rand(3)`

    #include <openssl/bn.h>

    int size = 32;

    BIGNUM *salt = BN_new();
    BN_rand(salt, size * 8, 0, 1);

The formula for password verifier `v` is defined as

    v = g^x % N

Where `N` is a large safe prime and `g` is a generator modulo N.
Computing large safe prime numbers may take a lot of time that's why most
WoW emulators are using hardcoded values for that.
So Let's reuse the values from [mangos](https://getmangos.eu)-based cores.

    N = 894B645E89E1535BBDAD5B8B290650530801B18EBFBF5E8FAB3C82872A3E9BB7
    g = 7

Those values are passed to the client therefore you can select whatever secure prime you prefer.
Changing such values afterwards will break already computed password verifiers.

The value for `x` will be a sha1 hash of salt and the password `p`

    x = sha1(s, p)

> SRP describes `p` as cleartext password while blizzard decided to choose a sha1 hash of
> colon separated username and password - both in capital letters.

To authenticate users the server must store the salt `s` as well as the password verifier `v`.
