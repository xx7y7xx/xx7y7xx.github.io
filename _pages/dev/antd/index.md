---
layout: page
title: antd ant design
permalink: /dev/antd/index.html
---

## Form

坑

当Form跟Form.Item之间存在Redux的Connect()的时候，Checkbox不能被check

```
CreateForm
`-- Form
    `-- Connect(Permissions)
        `-- FormItem
            `-- Checkbox
```

TODO demo [https://github.com/xx7y7xx/antd-form-demos](https://github.com/xx7y7xx/antd-form-demos)

## Select

In `mode` prop, what is the difference between `multiple` and `tags`

For `multiple`, when you input text in text box and the result is empty, there will be 'Not found' in the dropdown.

For `tags`, when you input text in text box and the result is empty, for example, you input `zzzz`, there will be 'zzzz' in the dropdown, and you click on the `zzzz` dropdown item, will create a new tag in the text box.

## ref

If you want to get ref after `Form.create`, you could use `wrappedComponentRef` provided by `rc-form`:

```
<UserForm
  wrappedComponentRef={form => (this.form = form)}
  id={1}
  onSubmit={this.handleSubmit}
/>
```

## Table

In `"antd": "3.26.20",` when pagination prop is null

```jsx
<Table
  ...
  pagination={null}
/>
```

The error is

```
Uncaught TypeError: Cannot use 'in' operator to search for 'current' in null
    at Table.getDefaultPagination (Table.js:809)
    at new Table (Table.js:761)
```

Try to change `pagination={false}`
