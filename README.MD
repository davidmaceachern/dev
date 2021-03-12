<div align="center">
   ☁️🖥️ 
</div>

<h1 align="center">
  Dev
</h1>

<p align="center">
Code to set up a developer environment.
</p>

<div align="center">
  <a alt="GitHub Workflow Status" href="https://github.com/davidmaceachern/dev/actions">
    <img  src="https://img.shields.io/github/workflow/status/davidmaceachern/dev/Deploy">
  </a>
</div>
<br />

## ✅Goals

Automated management of a VM which can be used as a Dev Box whilst staying within AWS Free Tier.

## 📦 Pre-requisites
* Fork this project and use as a template to start a new private repository!
* Add your `least priviledged AWS IAM User` credentials to your Github Repository secrets.
* Push to the main branch to trigger the deployment to AWS.

## ⚠️ Beware

Whilst using Github Actions as a build tool is great, beware for the possibility that sensitive secrets can be printed out when running Actions in a public repository. More details about secrets inside Actions can be found [here](https://docs.github.com/en/actions/learn-github-actions/security-hardening-for-github-actions)


## 👏🏻 Credit

- Setting up CI/CD with Terraform and Github Actions thanks to [Loujaybee](https://github.com/loujaybee/terraform-aws-github-action-bootstrap), you can read more about how this is achieved [here](https://www.thedevcoach.co.uk/setup-terraform-aws-github-actions/).
- [Contributors](https://github.com/NixOS/nixpkgs/blob/nixos-unstable/pkgs/applications/networking/cluster/terraform/default.nix#L42) who make it possible to get the latest Terraform using Nix.


David MacEachern (davidmaceachern) 2021
