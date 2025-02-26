//<script>
function onClick(e) {
    e.preventDefault();
    grecaptcha.enterprise.ready(async () => {
        const token = await grecaptcha.enterprise.execute('6LdtT9QqAAAAAG8wJpgJN2yvmQoc-aYHxpAMkttd', { action: 'LOGIN' });
    });
}
// </script>