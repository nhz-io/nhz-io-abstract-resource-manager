# AbstractResourceManager Class

[![Travis Build][travis]](https://travis-ci.org/nhz-io/nhz-io-abstract-resource-manager)
[![NPM Version][npm]](https://www.npmjs.com/package/@nhz.io/abstract-resource-manager)

## Install

```bash
npm i -S @nhz.io/abstract-resource-manager
```

## Usage
```js
const AbstractResourceManager = require('@nhz.io/abstract-resource-manager')

class Manager extends AbstractResourceManager {
  /* Implement the methods */
}

...
```

## Literate Source

### Manager

    class AbstractResourceManager

#### Start managing resource

      manage: (resource) ->

        return unless resource = @register resource

        job = @getJob resource

        if job

          @stop job, resource if @shouldStop job, resource

          config = @needUpgrade job, resource

          job = @upgrade job, config if config

          @start job, resource if @shouldStart job, resource

> Return the resource

        resource

#### Stop managing resouce

      unmanage: (resource) ->

        return unless resource = @unregister resource

        job = @getJob resource

        if job

          @stop job, resource if @shouldStop job, resource

          config = @needDowngrade job, resource

          job = @downgrade job, config if config

          @start job, resource if @shouldStart job, resource

> Return the resource

        resource

#### Unimplemented methods with *sane* defaults

      register: (resource) -> resource

      unregister: (resource) -> resource

      getJob: (resource) -> null

      shouldStart: (job, resource) -> false

      shouldStop: (job, resource) -> false

      needUpgrade: (job, resource) -> null

      needDowngrade: (job, resource) -> null

      upgrade: (job, config) -> null

      downgrade: (job, config) -> null

      start: (job, resource) -> job

      stop: (job, resource) -> job

    module.exports = AbstractResourceManager

## Tests

    test = require 'tape-async'

    test 'AbstractResourceManager constructor', (t) ->
      t.plan 1

      manager = new AbstractResourceManager

      t.ok manager instanceof AbstractResourceManager

## Version 0.1.1

## License [MIT](LICENSE)

[travis]: https://img.shields.io/travis/nhz-io/nhz-io-abstract-resource-manager.svg?style=flat
[npm]: https://img.shields.io/npm/v/@nhz.io/abstract-resource-manager.svg?style=flat
