# Mechanizing Synthetic Tait Computability in Istari

This repository contains the formalization of Sterling's Synthetic Tait Computability in Istari proof assistant. 

Synthetic Tait Computability (STC) is a synthetic approach to categorical gluing, a technique to prove meta-theory of type theories. STC is also known as an instance of proof-relevant logical relations, or logical relations as types. The canonical reference on STC is Sterling's thesis. 

Istari is a modern Nuprl-style proof assistant based on _computational_ type theory. It is a form of extensional type theory with equality reflection and extensionality principles. This gives tremendous advantage in formalizing STC because on-paper STC relies on an extensional type theory. As a result, our formalization is essentially verbatim compared to on-paper proofs.

## Our Formalization
We formalized two case studies of STC:
- Canonicity for a core dependent type theory with dependent products and booleans with large elimination.
- Canonicity for cost-aware logical framework (Calf), a call-by-push-value language with a writer monad effect and a phase distinction.

There are two reasonable ways to read the formalization:
- The heart of STC proof obligations is to check the given terms have the indicated types. For that it is sufficient to look at `DTT/Demo` and `Calf/Demo` directories, where we write down the terms and their types, and Istari type-checks them. In there, we include, in comment, the on-paper proof of each definition as show up in various paper. It should be immediate to see (hopefully) that the formalized terms and types are in one-to-one correspondence to the on-paper proofs, without anything like transports.
- On the other hand, the technical development of proving those terms indeed have the correct types happen in `DTT/Semantics` and `Calf/Semantics` directories, where we use a chain of tactics to establish well-typedness. 

In DTT we highlight the semantics of booleans and dependent products. In Calf we highlight the semantics of free-forgetful adjunction in call-by-push-value and the behavioral phase distinction. 

Each directory also contains a `Makefile`, and running `make` will type-check all definitions. In particular, we set it up modularly in a way that type-checking each file will only invoke its necessary dependencies. This way, for example, the semantics of dependent products is not dependent on the semantics of booleans and vice versa. This highlights the modular aspects of those gluing proofs, where extending them to a new type former is straightforward.

## Istari

Istari's official documentation is at https://istarilogic.org. Here we include a brief instruction on how to install and use Istari.

### Installation

This section is from Istari's documentation site.

1. Ensure the prerequisites are installed:

   - Git
   - Standard ML of New Jersey (version 110.89 or later, but see below)
   - GNU Emacs
   - (if running on Windows) Cygwin

   Some versions of Standard ML of New
   Jersey contain bugs or incompatibilities that keep Istari from
   compiling.  Version 110.99.7.1 is confirmed to work on Linux, Mac,
   and Windows.

2. Obtain the distribution from Github:

       git clone --recursive --branch v1.1 https://github.com/kcrary/istari.git istari

3. If you forgot to use the `--recursive` option in the previous step,
   populate the `cmlib` directory:

       git submodule init
       git submodule update

4. Configure the build script, by copying `Makefile.inc.customize` to
   `Makefile.inc`, then edit `Makefile.inc` to fill in the `INSTALLDIR`
   definition, and to uncomment one of the `MKNJEXEC` definitions.

5. Build Istari:

       make smlnj

6. Install Istari:

       make install

7. Copy the contents of `emacs.customize` into your `.emacs` file, and
   edit the `istari-root` definition with the path to the Istari root
   directory.

### Text editors

Istari supports two major text editors: Emacs and VS Code. 

Instructions on how to use Istari's Emacs extension can be found at https://istarilogic.org/ui.html.

Instructions on how to use Istari's VS Code extension can be found at
https://marketplace.visualstudio.com/items?itemName=pi314mm.istari. The keyboard shortcut on VS Code is essentially the same as those of Emacs.

