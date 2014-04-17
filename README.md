gearmand Cookbook
=================
Installs the gearmand server

Requirements
------------

#### packages
- `yum` - gearmand needs yum for installing the package

Attributes
----------
#### gearmand::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['gearmand']['job_retries']</tt></td>
    <td>Integer</td>
    <td>Number of job retries before the job is considered dead</td>
    <td><tt>0 (unlimited)</tt></td>
  </tr>
  <tr>
    <td><tt>['gearmand']['port']</tt></td>
    <td>Integer</td>
    <td>Port to run gearmand on</td>
    <td><tt>4730</tt></td>
  </tr>
  <tr>
    <td><tt>['gearmand']['more_options']</tt></td>
    <td>String</td>
    <td>More options to pass into gearmand</td>
    <td><tt>&lt;empty&gt;</tt></td>
  </tr>
</table>

Usage
-----
#### gearmand::default
Just include `gearmand` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[gearmand]"
  ]
}
```
