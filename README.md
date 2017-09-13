# akamai-api-cps

A ruby library which wraps the [Akamai CPS API](https://developer.akamai.com/api/luna/cps/overview.html).

https://github.com/rajiv/akamai-api-cps

Not all CPS API endpoints and features are implemented.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'akamai-api-cps'
```

And then execute:

    $ bundle

## Usage

First, setup `.edgerc` as detailed in the [AkamaiOPEN-edgegrid-ruby](https://github.com/akamai/AkamaiOPEN-edgegrid-ruby) gem instructions. Then:

```ruby
client = Akamai::API::CPS.new
enrollments = client.enrollments(contract_id)
enrollments.each do |enrollment|
  puts enrollment.csr.cn
end
```

```ruby
cert = production_certificate(enrollment_id)
cert_pem = production_full_chain(enrollment_id)

cert = staging_certificate(enrollment_id)
cert_pem = staging_full_chain(enrollment_id)
```

## Authors

Authored by [Rajiv Aaron Manglani](https://www.rajivmanglani.com/).

## License

Copyright 2017 Akamai Technologies, Inc. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
