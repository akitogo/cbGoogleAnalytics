# cbGoogleAnalytics
Implements Google Analytics for Contentbox 3.7 and 4.x

## Installation
- install module via Commandbox 

```
box install cbGoogleAnalytics
```
## Why should you use it?
This module adds to Contentbox admin section some config options for Google Analytics

## How to use?
Two interception points are used `cbui_beforeHeadEnd` and `cbui_beforeBodyEnd`

`cbui_beforeHeadEnd` inserts all needed JS for Google Analytics

`cbui_beforeBodyEnd` adds a page view send

Besides ease of use it disables tracking for Contenbox page previews
## Version
1.3 move tracking of pageview to cbui_beforeBodyEnd, restructured interceptor for better performance

1.2 buffer fix to make module compatible with Contentbox 3.7 and up

1.1 Added scroll depth tracker

## Written by
www.akitogo.com

## Disclaimer
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
